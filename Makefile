upgrade: 
	linkerd upgrade > linkerd/linkerd.yaml

apply:
	kubectl kustomize . | kubectl apply -f -
	# Apply l5d header override to the Kong deployment
	kubectl get deployment ingress-kong -n kong -o yaml | linkerd inject --ingress - | kubectl apply -f -
