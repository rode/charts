.PHONY: lint

lint:
	docker run --rm -v $$(pwd):/rode-charts/ -w /rode-charts quay.io/helmpack/chart-testing:v3.3.1 sh -c "helm repo add elastic https://helm.elastic.co; helm repo add rode https://rode.github.io/charts; helm repo update; ct lint --all"