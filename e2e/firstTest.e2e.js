describe('App', () => {
  beforeAll(async () => {
    await detox.init(undefined, { launchApp: false });
    await device.launchApp();
  });
  beforeEach(async () => {
    await device.launchApp();
    await device.reloadReactNative();
  });

  it('should show the step one message', async () => {
    await expect(element(by.id('stepOne'))).toBeVisible();
  });
});
