# myapp

## Overview
This project demonstrates how to deploy a Python application on OpenShift with CI/CD using Helm charts, Tekton pipelines.

## Directory Structure
- `Dockerfile`: Dockerfile to build the application image.
- `helm/`: Helm charts for deploying the application.
- `tekton/`: Tekton pipeline and tasks for CI/CD.
- `openshift/`: OpenShift-specific resources like ImageStream and BuildConfig.
- `src/`: Source code of the Python application.

## Steps to Deploy

1. **Create OpenShift Resources:**
   ```sh
   oc apply -f openshift/imagestream.yaml
   oc apply -f openshift/buildconfig.yaml
   ```

2. **Start a Build:**
   ```sh
   oc start-build myapp
   ```

3. **Deploy Helm Chart:**
   ```sh
   helm install myapp helm/myapp
   ```

4. **Set Up Tekton Pipeline:**
   ```sh
   oc apply -f tekton/pipeline.yaml
   oc apply -f tekton/tasks/build.yaml
   oc apply -f tekton/tasks/deploy.yaml
   ```

5. **Get Route Details:**
   ```sh
   oc get routes -n adhikaria-dev
   ```

6. **Access the Application:**
   - The application will be available at the route hostname provided by OpenShift.

## Rollback
To rollback to a previous version, use Helm:
```sh
helm rollback myapp <revision>
```
