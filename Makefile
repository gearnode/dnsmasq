VERSION=v2.80

.PHONY:
buildall:
	number=0 ; while [[ $$number -le 80 ]] ; do \
		docker build --build-arg VERSION=v2.$$number --tag gearnode/dnsmasq:v2.$$number . ; \
		docker push gearnode/dnsmasq:v2.$$number ; \
		((number = number + 1)) ; \
	done

build:
	docker build --build-arg VERSION=$(VERSION) --tag gearnode/dnsmasq:$(VERSION) . ; \
	docker push gearnode/dnsmasq:$(VERSION) ; \
