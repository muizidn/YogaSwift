bootstrap_project: submodule_init create_static_library

submodule_init:
	git submodule update --init --recursive

create_static_library:
	cd Submodules/Yoga && buck build //:yoga