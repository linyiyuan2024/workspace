
// Application configuration
const config = {
  appName: "Auth System",
  apiBaseUrl: "http://localhost:53124",
  routes: {
    home: "/",
    login: "/login",
    register: "/register",
    forgotPassword: "/forgot-password",
    dashboard: "/dashboard"
  },
  authTokenKey: "authToken"
};

export default config;
