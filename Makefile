.PHONY: lint install-test-main install-test-collectors-setup install-test-collectors install-test-coolectors-teardown install-test

lint:
	docker run --rm -v $$(pwd):/rode-charts/ -w /rode-charts quay.io/helmpack/chart-testing:v3.3.1 sh -c "helm repo add elastic https://helm.elastic.co; helm repo add rode https://rode.github.io/charts; helm repo update; ct lint --all"

install-test-main:
	ct install --target-branch main --excluded-charts rode-collector-harbor --helm-extra-args --timeout 10m

install-test-collectors-setup:
	helm install -n rode-test --create-namespace rode-test ./charts/rode -f ./charts/rode/ci/test-values.yaml --wait

install-test-collectors:
	ct install --target-branch main --excluded-charts rode,grafeas-elasticsearch --helm-extra-args --timeout 10m

install-test-collectors-teardown:
	helm uninstall -n rode-test rode-test
	kubectl delete namespace rode-test

install-test: install-test-main install-test-collectors-setup install-test-collectors install-test-collectors-teardown