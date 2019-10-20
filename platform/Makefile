init:
	$(MAKE) -C k8s $@
	$(MAKE) -C kms $@
	$(MAKE) -C cloudbuild $@

plan: init
	$(MAKE) -C k8s $@
	$(MAKE) -C kms $@
	$(MAKE) -C cloudbuild $@

apply: init
	$(MAKE) -C kms $@
	$(MAKE) -C cloudbuild $@
	#$(MAKE) -C k8s $@

destroy: init
	$(MAKE) -C kms $@
	$(MAKE) -C k8s $@
	$(MAKE) -C cloudbuild $@


