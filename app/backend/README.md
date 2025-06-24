# Backend Service for Azure Search + OpenAI Demo

This directory contains the backend service for the Azure Search + OpenAI Demo application. The backend is built with Python, leverages Azure services, and is designed for both local development and cloud deployment.

## Features
- REST API for interacting with Azure OpenAI and Azure Cognitive Search
- Integration with Azure Blob Storage, Data Lake, and other Azure resources
- Asynchronous, scalable web server using Quart and Gunicorn
- Telemetry and monitoring with OpenTelemetry and Azure Monitor
- Speech synthesis and other AI capabilities

## Directory Overview
- `main.py`: Entry point for the backend service. Loads environment variables and creates the app instance.
- `app.py`: Main application logic, including API routes and Azure service integrations.
- `config.py`: Configuration management for the backend.
- `core/`, `approaches/`, `chat_history/`, `prepdocslib/`: Supporting modules for core logic, retrieval approaches, chat history, and document preparation.
- `Dockerfile`: Containerization instructions for building and running the backend service.
- `requirements.txt`: Python dependencies for the backend.

## Getting Started (Local Development)
1. Install Python 3.11.
2. Install dependencies:
   ```powershell
   pip install -r requirements.txt
   pip install gunicorn
   ```
3. Start the backend server:
   ```powershell
   python -m gunicorn -b 0.0.0.0:8000 main:app
   ```

## Running with Docker
1. Build the Docker image:
   ```powershell
   docker build -t azure-search-openai-backend .
   ```
2. Run the container:
   ```powershell
   docker run -p 8000:8000 azure-search-openai-backend
   ```

## Environment Variables
- The backend loads environment variables from Azure or from local `.env` files for development.
- See `main.py` and `load_azd_env.py` for details on environment setup.

## Azure Integration
- Designed to run on Azure App Service or Azure Container Apps.
- Uses managed identity and Azure SDKs for secure access to resources.

## Python Requirements
The backend depends on the following key Python packages (see `requirements.txt` for the full list):

- `aiofiles` — async file operations
- `aiohappyeyeballs`, `aiohttp`, `aiosignal`, `async-timeout` — async HTTP and networking
- `annotated-types`, `anyio`, `asgiref`, `attrs` — async utilities and type support
- Azure SDKs: `azure-ai-documentintelligence`, `azure-cognitiveservices-speech`, `azure-common`, `azure-core` — Azure AI and resource integration

These packages support async web serving, Azure SDK integration, and various backend features. For all dependencies and their versions, refer to the [`requirements.txt`](./requirements.txt) file.

## License
See [LICENSE](../../LICENSE) for license information.
