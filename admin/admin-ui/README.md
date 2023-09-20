
## Technologies Used
This web app was built using the following technologies:

- Node.js 16+
- React.js
- Express

## How to Run the App
To run this web app, please follow these steps:

- Install the required dependencies by running `npm install`.
- Generate types from the OpenAPI definition by running `npm run types-gen`.
- Start the server by running `npm run node-dev`.
- Open a new terminal tab and start the client app by running `npm run react-dev`.
- Access the web app in your browser at http://localhost:4000.


> Note: Before starting the server and client app, ensure that the latest types are available on the client side by running `npm run types-gen`. The node-dev script will start the server in development mode using nodemon which will automatically reload the server whenever changes are made. The react-dev script will watch for changes in the client app and automatically rebuild the client app when changes are detected.

## Client and Server

The web app has two main components: the client and the server. These components are separated into two folders to make it easier to manage and maintain.

The purpose of the server is twofold: first, to host the static HTML, CSS, and JavaScript files generated by the webpack build. These files can be found in the `client/public` folder. This is important because these files are what the user's browser needs to load the web app. By hosting these files on the server, we ensure that the user can access them whenever they want to use the app.

The second purpose of the server is to host server-side endpoints. These endpoints allow the server to communicate with other parts of the web app or with external services. In this case, the web app is using an OIDC flow, which is a protocol used for authentication and authorization.

The web app is using the `/token` endpoint in the OIDC flow. When the user requests access to a protected resource, they will be redirected to a login page on the IDP side (the Identity Provider). Once the user logs in and authorizes the app to access their data, the IDP will redirect the user back to the /token endpoint on the web app's server.

In `server/routes/tokenRoutes.js`, the server will receive the authorization code from the IDP and use it to generate a token request to the IDP. This token request will include information about the user and the requested access. When the server receives a successful token response from the IDP, it will set response cookies with the access token and redirect the user back to the client-side of the web app.
## Authentication Implementation Details

In the React side there are two Auth implementations. The one been use at the moment is the `client/source/auth/AuthProvider.tsx`. This component is a Higher order component to provide authedication via APK IDP. From the IDP side the PKCE is not supported. `client/source/auth/AuthProviderPKCE.tsx` This file is providing the authentication with Oath0. You have to change the import in `client/source/App.jsx` and enable the correct configuration from `client/public/conf/Settings.js`.

The AuthProvider component defines secure routes for the application by storing the user authentication state and related functions in a context, and then using this context to render the protected components.

The AuthProvider component wraps the MainRoutes component, which contains the application's routes. When the MainRoutes component is rendered, it will check whether the user is authenticated, and if not, it will redirect the user to the login page. If the user is authenticated, the requested route will be rendered.

The AuthProvider component defines a context for storing the user authentication state and related functions using the createContext method from the React library. The context is defined with an initial state that includes the user's authentication status (isAuthenticated), the user object (user), and a loading flag (loading). The context also includes two functions: login and logout, which handle user login and logout actions.

### React Libraries

We are using the latest version of MUI at the time of writing ( 5.x ), React Router (6.x), and react-table 7.x. This means that we can't directly copy the code from apim-apps repos and use them. You will have to go through the documentation of each library and make the necessary adjustments.

### Development and reloading

During development, we have opted not to use the webpack dev server. Instead, we've devised a method to easily view changes as we make them. We made this decision because the webpack dev server cannot proxy all API requests and the authentication flow, and there are instances where the actual environment and the proxy environment behave differently. The following describes how we have implemented live reloading.

When the node server is running it starts a live reloading server at port @ 35729. This is done via the code segment at `server/app.js`

```javascript
var livereload = require("livereload");
const connectLivereload = require("connect-livereload");
...
...
const liveReloadServer = livereload.createServer();
liveReloadServer.watch(path.join(__dirname, '../client/public/build'));
liveReloadServer.server.once("connection", () => {
  setTimeout(() => {
    liveReloadServer.refresh("/");
  }, 100);
});
```

We manually inject the javascript to the html file via the template html file `client/pages/index.html`.

```html
    <% if( htmlWebpackPlugin.options.templateParameters.env === 'development' ) { %>
    <script src="http://localhost:35729/livereload.js?snipver=1" async="" defer=""></script>
    <% } %>
```

> Note: We have the drawback of not having Hot Module Replacement.