

import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { ThemeProvider, createTheme } from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';
import config from './config/config';
import LoginPage from './pages/LoginPage';
import RegisterPage from './pages/RegisterPage';
import ForgotPasswordPage from './pages/ForgotPasswordPage';
import DashboardPage from './pages/DashboardPage';
import HomePage from './pages/HomePage';

const theme = createTheme({
  palette: {
    mode: 'light',
    primary: {
      main: '#1976d2',
    },
    secondary: {
      main: '#dc004e',
    },
  },
});

function App() {
  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <Router>
        <Routes>
          <Route path={config.routes.home} element={<HomePage />} />
          <Route path={config.routes.login} element={<LoginPage />} />
          <Route path={config.routes.register} element={<RegisterPage />} />
          <Route path={config.routes.forgotPassword} element={<ForgotPasswordPage />} />
          <Route path={config.routes.dashboard} element={<DashboardPage />} />
        </Routes>
      </Router>
    </ThemeProvider>
  );
}

export default App;

