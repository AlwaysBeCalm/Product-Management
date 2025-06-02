FROM python:alpine

# Create app directory
WORKDIR /app

# Copy application files
COPY . /app

# add path
ENV PATH="/root/.local/bin:$PATH"

# Install dependencies
RUN wget -qO- https://astral.sh/uv/install.sh | sh && uv pip install --no-cache-dir -r pyproject.toml --system

# Expose port
EXPOSE 8000

# Start the application
ENTRYPOINT ["python", "-Bm", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
