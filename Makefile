.PHONY: all movie rating metadata clean help

# Default target - run all services
all: movie rating metadata

# Run movie service
movie:
	@echo "Starting movie service..."
	@cd movie/cmd && go run main.go

# Run rating service
rating:
	@echo "Starting rating service..."
	@cd rating/cmd && go run main.go

# Run metadata service
metadata:
	@echo "Starting metadata service..."
	@cd metadata/cmd && go run main.go

# Run all services concurrently (in background)
run-all:
	@echo "Starting all services..."
	@cd movie/cmd && go run main.go & \
	cd rating/cmd && go run main.go & \
	cd metadata/cmd && go run main.go & \
	wait

# Clean/stop any running services (kills go run processes)
clean:
	@echo "Stopping all services..."
	@pkill -f "go run main.go" || true

# Help target
help:
	@echo "Available targets:"
	@echo "  make movie       - Run movie service"
	@echo "  make rating      - Run rating service"
	@echo "  make metadata    - Run metadata service"
	@echo "  make run-all     - Run all services concurrently"
	@echo "  make clean       - Stop all running services"
	@echo "  make help        - Show this help message"