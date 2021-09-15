# Rails On ArgoCD

## Prepare

1. Kubernetes cluster
2. ArgoCD

## Demo

1. Clone this repo
   `git clone git@github.com:agate/rails_on_argocd.git`

2. Apply V1

   `kubectl apply -f versions/v1/argocd/argocd-application.yaml`

   What we can learn from this version?

   1. How to wait when database ready before start the application container.
   2. How to run database init script to create database / tables

   After ArgoCD synced. Run `kubectl port-forward -n rails-on-argocd svc/rails-on-argocd-app 3000:3000` and access http://localhost:3000. You should see the default rails welcome page.

3. Apply V2

   `kubectl apply -f versions/v2/argocd/argocd-application.yaml`

   What we can learn in this version?

   1. Before the database migrate be executed. The rails server still running in the old version. The new container will be created after the all the migrations are executed.

   After ArgoCD synced. Stop the previous port-forward command and restart the port-forward by running `kubectl port-forward -n rails-on-argocd svc/rails-on-argocd-app 3000:3000` and access http://localhost:3000. You should see a json output which contains all two users data (sam / dean)
