# Backend

This directory contains the backend code for the application. The backend is built using Python and provides the API and business logic for the application

## Prerequisites

- Python 3.11
- [pip](https://pip.pypa.io/en/stable/installation/)
- [virtualenv](https://virtualenv.pypa.io/en/latest/installation.html)

## Setup

1. Create a virtual environment:

    ```sh
    python -m venv venv
    ```

2. Activate the virtual environment:

    - On Windows:

        ```sh
        .\venv\Scripts\activate
        ```

    - On Linux/Mac:

        ```sh
        source venv/bin/activate
        ```
        3. Install the dependencies listed in `requirements.txt`:

            ```sh
            pip install -r requirements.txt
            ```

        ## requirements.txt

        The `requirements.txt` file should include the following dependencies:

        ```
        fastapi==0.70.0
        uvicorn==0.15.0
        pydantic==1.8.2
        requests==2.26.0
        ```
3. Install the dependencies:

    ```sh
    pip install -r requirements.txt
    ```

## Running the Backend Server

To start the backend server, run:

```sh
python main.py