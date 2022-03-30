const helper = async (victim: any, attacker: any) => {
  for (let i = 0; i < 10; i++) {
    await attacker.hackContract();
  }
};

export default helper;
