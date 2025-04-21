import requests
import time
import json
import os

def send_echo_request():
    # Get the service URL from environment or use default
    base_url = os.getenv('ECHO_SERVICE_URL', 'http://umbrella-echo-server:5000')
    url = f"{base_url}/echo"
    data = {"message": "test message"}
    try:
        response = requests.post(url, json=data)
        return response.status_code
    except Exception as e:
        print(f"Error sending request: {e}")
        return None

def main():
    print("Starting load test...")
    for i in range(100):
        status = send_echo_request()
        if status:
            print(f"Request {i+1}: Status {status}")
        time.sleep(0.1)  # Small delay between requests

if __name__ == "__main__":
    main() 