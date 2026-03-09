.PHONY: all push

CHART=affine-$(shell yq -r .version < affine/Chart.yaml).tgz
REPO=oci://registry-1.docker.io/postmaxin

all:
	echo "Targets: package push"

package: dist/$(CHART)

dist/$(CHART)::
	mkdir -p dist
	helm package -d dist affine

push: dist/$(CHART)
	helm push "dist/$(CHART)" "$(REPO)"
