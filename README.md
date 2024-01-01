# GCP_setup
Scripts useful for setting up an Ubuntu-based GCP instance with basic Poetry/Docker/Kubernetes/Azure

# Intro to API deployment on GCP from scratch

Basic Workflow
- **git**: software development workflow
- **ssh**: connecting to remote systems
- **bash**: scripting for Linux
- **VS Code**: preferred GUI-based programming tool
- **tmux**: linux-based terminal tool

Automating Workflow
- **gcloud**: setting up GCP instances
- **ansible**: repeatable setup of remote computing environments
- **GitHub Actions**: triggerable compute/actions, flexible tool for Continuous Integration / Continuous Deployment (CI/CD)


Python development
- **poetry**: python library management
- **fastAPI**: python-based web framework
- **logging**: keeping track of execution and events via append-only files
- **pydantic**: data validation
- **pytest**: unit testing for python
- **uvicorn**: server for web frameworks

Containerization of code
- **Docker**: containerization of applications
- **Kubernetes**: orchestration of containers on computer clusters

This is a mess of sprawling topics, and can be looked at as a sequence of increasingly complicated tutorials meant to introduce different features and workflows.

# Tutorials

## Phase 0: Setup
1. **GCP setup** (gcloud / ssh)
2. **Environment setup** (bash / VS Code / git / terminals)
3. **Ansible for setup** (gcloud / ansible)

## Phase 1: local basic API
4. **Basic Operations** (bash scripting / tmux)
5. **Simple Web Framework** (Poetry / FastAPI / Uvicorn)
6. **Improved Python** (Pydantic / Pytest / Logging)
7. **Simple Server** (Uvicorn)

## Phase 2: API containerization and caching
8. **Dockerized python development** ()
9. **Docker interactions** (exec / repositories / logs /volumes / VS Code )
10. **Docker 'Better' Practices** (two-stage Dockerfile)
11. **Caching** (docker-compose / Redis)
12. **Debugging with Docker** (debugpy)
13. **RESTful API** (RESTful API)
14. **User Interface** (Streamlit / html / htmx / js)

## Phase 3: Kubernetes
15. 