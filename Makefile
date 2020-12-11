upgrade: 
	linkerd upgrade > linkerd/linkerd.yaml

apply:
	kubectl kustomize . | kubectl apply -f -
	cat kong/gateway.yaml | linkerd inject - | kubectl apply -f -
	cat cert-manager/cert-manager.yaml | linkerd inject - | kubectl apply -f -
	kubectl rollout restart deployment -n kong ingress-kong
	kubectl rollout restart deployment -n cert-manager cert-manager
	kubectl rollout restart deployment -n cert-manager cert-manager-cainjector
	kubectl rollout restart deployment -n cert-manager cert-manager-webhook