

BUILD_CMD = docker run -e PACKERFILE=$(basename $@).json -v "${PWD}:/img" -v packer_cache:/root/packer_cache --privileged -it --rm satackey/packer-builder-arm-image


raspbian-secure_ssh.img: raspbian-secure_ssh.json scripts/secure_ssh.sh
	$(BUILD_CMD)

raspbian-secure_ssh-replace_user.img: raspbian-secure_ssh.img raspbian-secure_ssh-replace_user.json scripts/replace_user.sh
	$(BUILD_CMD)

raspbian-secure_ssh-replace_user-prepare_for_building_softethervpn.img: raspbian-secure_ssh-replace_user.img raspbian-secure_ssh-replace_user-prepare_for_building_softethervpn.json scripts/prepare_for_building_softethervpn.sh
	$(BUILD_CMD)

raspbian-secure_ssh-replace_user-prepare_for_building_softethervpn-build_softethervpn.img: raspbian-secure_ssh-replace_user-prepare_for_building_softethervpn.img raspbian-secure_ssh-replace_user-prepare_for_building_softethervpn-build_softethervpn.json scripts/build_softethervpn.sh
	$(BUILD_CMD)
