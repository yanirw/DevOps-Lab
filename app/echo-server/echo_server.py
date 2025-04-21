from flask import Flask, request, jsonify
from prometheus_flask_exporter import PrometheusMetrics
from prometheus_client import make_wsgi_app, Counter, Histogram
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from werkzeug.serving import run_simple
import threading
import time

app = Flask(__name__)
metrics = PrometheusMetrics(app)

# Create metrics that match the Grafana dashboard
http_requests_total = Counter('http_requests_total', 'Total number of HTTP requests', ['method', 'endpoint', 'status'])
http_request_duration_seconds = Histogram('http_request_duration_seconds', 'HTTP request duration in seconds', ['method', 'endpoint'])

@app.route('/echo', methods=['POST'])
def echo():
    start_time = time.time()
    try:
        data = request.json
        response = jsonify(data)
        status = 200
    except Exception as e:
        response = jsonify({"error": str(e)}), 400
        status = 400
    
    # Record metrics
    http_requests_total.labels(
        method=request.method,
        endpoint='/echo',
        status=status
    ).inc()
    
    duration = time.time() - start_time
    http_request_duration_seconds.labels(
        method=request.method,
        endpoint='/echo'
    ).observe(duration)
    
    return response

@app.route('/health', methods=['GET'])
def health():
    return jsonify({"status": "healthy"}), 200

# Create a dispatcher to serve the app and metrics on different ports
app_dispatcher = DispatcherMiddleware(app, {
    '/metrics': make_wsgi_app()
})

def run_metrics_server():
    run_simple('0.0.0.0', 8080, app_dispatcher)

if __name__ == '__main__':
    # Start the metrics server in a separate thread
    metrics_thread = threading.Thread(target=run_metrics_server)
    metrics_thread.start()
    
    # Run the main app on port 5000
    app.run(host='0.0.0.0', port=5000)