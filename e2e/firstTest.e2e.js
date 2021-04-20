beforeAll(async () => {
  await detox.init(undefined, { launchApp: false });
  await device.launchApp();
  await device.reloadReactNative();
});

afterAll(async done => {
  //allows Jest to exit successfully.
  done();
});

describe('App', () => {
  it('should show the step one message', async () => {
    await expect(element(by.id('stepOne'))).toBeVisible();
  });
});
