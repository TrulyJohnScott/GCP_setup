# GCP_setup
Scripts useful for setting up an Ubuntu-based GCP instance with basic Poetry/Docker/Kubernetes/Azure

# Files
- **GCP_setup.md**: this is the simple how-to guide that I used during MIDS 255 (ML Deployment) at UC Berkeley (Machine Learning Systems Engineering)
- **env_setup.sh**: this file is meant to be run on a  newly-created Ubuntu-based instance. It was originally used to setup a GCP instance quickly for Python, Poetry,Docker, and Kubernetes/minikube. 

# Planned (!) Tutorials
## Section 1: ML Development

### Part 1: Setup
1. **GCP setup** (gcloud / ssh)
2. **Environment setup** (bash / VS Code / git / terminals / tmux)
3. **Ansible for setup** (gcloud / ansible)

### Part 2: Local basic API
4. **Basic Operations** (bash scripting / tmux)
5. **Simple Web Framework** (Poetry / FastAPI / Uvicorn)
6. **Improved Python** (Pydantic / Pytest / Logging)
7. **Simple Server** (Uvicorn)

### Part 3: API containerization and caching
8. **Dockerized python development** (VS Code containers & debugging)
9. **Docker interactions** (exec / repositories / logs /volumes / VS Code )
10. **Docker 'Better' Practices** (two-stage Dockerfile)
11. **Caching** (docker-compose / Redis)
12. **Debugging with Docker** (debugpy)
13. **RESTful API** (RESTful API)
14. **User Interface** (Streamlit / html / htmx / js)

## Section 2: ML Deployment

### Part 4: Local Kubernetes
15. **Kubernetes with minikube** (minikube / kubectl)
16. **Deployments and services** ()
17. **Scripting, careful setup & debugging** ()

### Part 5: Running Kubernetes
18. **GKE setup** ()
19. **Kustomize** ()
20. **Skaffold** ()

### Part 6: Grafana / Prometheus / K6
21. **Istio** ()
22. **Prometheus** ()
23. **Grafana** ()

### Part 7: 
24. **K6**
25. **Adjustments for Scaling/Performance**

## Section 3: ML Maintenance

26. **Data Acquisition**
27. **Feature Store**
28. **Training**
29. **Model Store**
30. **Metrics**
31. **Drift Detection**
32. **Retraining / Redeployment**