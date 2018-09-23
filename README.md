# RISE IoT Containers

Stack is included `nodered` and `TTN gateway`, that deployed via [`resin.io`](https://resin.io/)

## Node Red

### Prerequisites

Setup these environment variables via `Device Environment Variables` or `Device Service Variables` on [https://dashboard.resin.io](https://dashboard.resin.io)

- `NODE_RED_USER` (required): Admin User login for `Basic Authentication`
- `NODE_RED_PASSWORD`: Encrypted password with `bcrypt` with `compute = 8`
- `NODE_RED_PLAIN_PASSWORD`: Plain password
- `LOG_LEVEL` (optinal): specific `node-red` log level. Default is `info`.

If `NODE_RED_PASSWORD` is not yet defined, system will generate encrypted password by `NODE_RED_PLAIN_PASSWORD` and print to console. Then you can copy and re-define `NODE_RED_PASSWORD` and remove `NODE_RED_PLAIN_PASSWORD` on `resin` dashboard. The service will be restarted and updated automatically.

If `NODE_RED_USER` or one of `NODE_RED_PASSWORD` and `NODE_RED_PLAIN_PASSWORD` is blank, service will crash.

### Implemenation note

- Require using USB -> add user to group `dialout`
- To add more libraries in NodeRed, update `package.json` then rebuild `resin` image by pushing code to your `git.resin.io`

### Note

If `USB serial port` does not work properly in some reason, use `usb_reset` library flow with `USB_VENDOR_ID` and `USB_VENDOR_PRODUCT` in environement variables.

## TTN Gateway

Setup these environment variables via `Device Environment Variables` or `Device Service Variables` on [https://dashboard.resin.io](https://dashboard.resin.io)

- `GW_ID`: copy the value listed for the `Gateway ID` in the TTN console.
- `GW_KEY`: on the TTN console click on the little eye icon to the right of `Gateway Key`, this will display the value. Now use the icon at the end of the line to copy the value (and display `copied`)
- `GW_RESET_PIN`: value = `11`

## Deploy

1. Get the code from github

   ```bash
   git clone https://github.com/zero-88/rise-iot-containers.git
   cd rise-iot-containers
   ```

2. Add `resin` remote.

   ```bash
   git remote add resin <your resin.io account>@git.resin.io:<your resin.io account>/rise-iot-containers.git
   ```

3. Push to `resin` then enjoy coffee in while `resin` service build and deploy your app.

   ```bash
   git push resin master
   ```
