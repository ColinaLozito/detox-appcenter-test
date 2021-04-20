beforeAll(async done => {
  await detox.init(undefined, { launchApp: false });
  await device.launchApp();
  await device.reloadReactNative();
  done();
});

describe('App', () => {
  it('should show the step one message', async done => {
    await expect(element(by.id('stepOne'))).toBeVisible();
    done();
  });
});
