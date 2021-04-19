.PHONY: lint install-test-grafeas-elasticsearch install-test-rode install-test-rode install-test-rode-ui
.PHONY: install-test-collectors-enforcers-setup install-test-collectors-enforcers install-test-collectors-enforcers-teardown

lint:
	docker run --rm -v $$(pwd):/rode-charts/ -w /rode-charts quay.io/helmpack/chart-testing:v3.3.1 sh -c "helm repo add elastic https://helm.elastic.co; helm repo add rode https://rode.github.io/charts; helm repo update; ct lint --all"

install-test-grafeas-elasticsearch:
	ct install --target-branch main --charts charts/grafeas-elasticsearch --helm-extra-args --timeout=10m

install-test-rode:
	ct install --target-branch main --charts charts/rode --helm-extra-args --timeout=10m

install-test-rode-ui:
	ct install --target-branch main --charts charts/rode-ui --helm-extra-args --timeout=10m

install-test-collectors-enforcers-setup:
	helm install -n rode-test --create-namespace rode-test ./charts/rode -f ./charts/rode/ci/test-values.yaml --wait

install-test-collectors-enforcers:
	ct install --target-branch main --excluded-charts rode,rode-ui,grafeas-elasticsearch --helm-extra-args --timeout=10m

install-test-collectors-enforcers-teardown:
	helm uninstall -n rode-test rode-test
	kubectl delete namespace rode-test

install-test: install-test-rode install-test-rode-ui install-test-grafeas-elasticsearch install-test-collectors-enforcers-setup install-test-collectors-enforcers install-test-collectors-enforcers-teardown
