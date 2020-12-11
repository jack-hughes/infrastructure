upgrade: 
	linkerd upgrade > linkerd/linkerd.yaml

apply:
	kubectl kustomize . | kubectl apply -f -
