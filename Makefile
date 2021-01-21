.PHONY: lint install-test-main install-test-collectors-setup install-test-collectors install-test-coolectors-teardown install-test

lint:
	docker run --rm -v $$(pwd):/rode-charts/ -w /rode-charts quay.io/helmpack/chart-testing:v3.3.1 sh -c "helm repo add elastic https://helm.elastic.co; helm repo add rode https://rode.github.io/charts; helm repo update; ct lint --all"

install-test-main:
	ct install --charts charts/grafeas-elasticsearch,charts/rode

install-test-collectors-setup:
	kubectl create namespace rode-test
	helm install -n rode-test rode-test ./charts/rode -f ./charts/rode/ci/test-values.yaml --wait

install-test-collectors:
	ct install --charts charts/rode-collector-*

install-test-collectors-teardown:
	helm uninstall -n rode-test rode-test
	kubectl delete namespace rode-test

install-test: install-test-main install-test-collectors-setup install-test-collectors install-test-collectors-teardown