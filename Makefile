new:
	@echo Building VM...
	@vagrant up

fresh: clean
	@echo Building VM...
	@vagrant up

clean:
	@echo Removing VM...
	@vagrant destroy -f
	@echo -n "Cleaning directories - "
	@if [ -d .vagrant ]; then \
		rm -rf .vagrant; \
		echo "Done..."; \
	else \
		echo "Nothing to do..."; \
	fi;
