.PHONY: help venv install test api cli-help clean

# Default target
help:
	@echo "Music Track Generator - Available targets:"
	@echo ""
	@echo "  make venv       - Create a virtual environment"
	@echo "  make install    - Install dependencies and package"
	@echo "  make test       - Run tests with pytest"
	@echo "  make api        - Start the API server"
	@echo "  make cli-help   - Show CLI help"
	@echo "  make clean      - Remove virtual environment and cache files"
	@echo ""

# Create virtual environment
venv:
	@echo "Creating virtual environment..."
	python -m venv venv
	@echo "Virtual environment created. Activate with:"
	@echo "  source venv/bin/activate  (Linux/Mac)"
	@echo "  venv\\Scripts\\activate     (Windows)"

# Install dependencies
install:
	@echo "Installing dependencies..."
	pip install -r requirements.txt
	pip install -e .
	@echo "Installation complete!"

# Run tests
test:
	@echo "Running tests..."
	pytest tests/ -v

# Start API server
api:
	@echo "Starting API server on http://0.0.0.0:8080"
	@echo "Press Ctrl+C to stop"
	uvicorn music_generator.api:app --host 0.0.0.0 --port 8080

# Show CLI help
cli-help:
	@echo "Music Track Generator CLI Commands:"
	@echo ""
	music-gen --help
	@echo ""
	@echo "Generate command options:"
	@echo ""
	music-gen generate --help

# Clean up
clean:
	@echo "Cleaning up..."
	rm -rf venv
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	@echo "Clean complete!"
