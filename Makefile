build:
	bpt make-repo -O main
	bpt make-repo -O community

clean:
	rm -f */*.pkgidx
	rm -f */*.fileidx
	rm -f */*.bpt

sign:
	bpt sign --needed */*.bbuild

check-update:
	@ bpt verify */*.bbuild
	@ for bbuild in */*.bbuild; do \
		. /bedrock/strata/$$(brl which bpt)/etc/bpt/make.common && \
		. $${bbuild} && \
		echo "checking $${bbuild}" && \
		latest=$$(upstream_pkgver) && \
		if [ -z "$${latest}" ]; then \
			echo "  unable to determine latest version"; \
		elif [ "$${pkgver}" != "$${latest}" ]; then \
			echo "  update available: $${pkgver} -> $${latest}"; \
		fi; \
	done
