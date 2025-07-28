

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { 
  Container,
  Box,
  Typography,
  TextField,
  Button,
  Checkbox,
  FormControlLabel,
  Link
} from '@mui/material';
import axios from 'axios';
import config from '../config/config';

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [rememberMe, setRememberMe] = useState(false);
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post(`${config.apiBaseUrl}/auth_api.php?action=login`, {
        email,
        password,
        remember_me: rememberMe
      });
      
      if (response.data.success) {
        localStorage.setItem(config.authTokenKey, response.data.token);
        navigate(config.routes.dashboard);
      } else {
        setError(response.data.error || 'Login failed');
      }
    } catch (err) {
      setError(err.response?.data?.error || 'Login failed');
    }
  };

  return (
    <Container maxWidth="sm">
      <Box sx={{ mt: 8, display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
        <Typography component="h1" variant="h5">
          Sign in to {config.appName}
        </Typography>
        {error && <Typography color="error">{error}</Typography>}
        <Box component="form" onSubmit={handleSubmit} sx={{ mt: 1 }}>
          <TextField
            margin="normal"
            required
            fullWidth
            label="Email Address"
            autoComplete="email"
            autoFocus
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
          <TextField
            margin="normal"
            required
            fullWidth
            label="Password"
            type="password"
            autoComplete="current-password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
          <FormControlLabel
            control={<Checkbox 
              checked={rememberMe} 
              onChange={(e) => setRememberMe(e.target.checked)} 
              color="primary" 
            />}
            label="Remember me"
          />
          <Button
            type="submit"
            fullWidth
            variant="contained"
            sx={{ mt: 3, mb: 2 }}
          >
            Sign In
          </Button>
          <Box sx={{ display: 'flex', justifyContent: 'space-between' }}>
            <Link href={config.routes.register} variant="body2">
              Don't have an account? Sign Up
            </Link>
            <Link href={config.routes.forgotPassword} variant="body2">
              Forgot password?
            </Link>
          </Box>
        </Box>
      </Box>
    </Container>
  );
}

