init:
	$(MAKE) -C k8s $@
	$(MAKE) -C cloudbuild $@

plan: init
	$(MAKE) -C k8s $@
	$(MAKE) -C cloudbuild $@

apply: init
	#$(MAKE) -C k8s $@
	$(MAKE) -C cloudbuild $@

destroy: init
	$(MAKE) -C k8s $@
	$(MAKE) -C cloudbuild $@


