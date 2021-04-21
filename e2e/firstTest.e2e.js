beforeAll(async () => {
  await detox.init();
  await device.launchApp();
  await device.reloadReactNative();
});

afterAll(async () => {
  await detox.cleanup();
});

describe('App', () => {
  it('should show the step one message', async () => {
    await expect(element(by.id('stepOne'))).toBeVisible();
  });
});
