


import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Container,
  Box,
  Typography,
  TextField,
  Button,
  Link,
  Stepper,
  Step,
  StepLabel
} from '@mui/material';
import axios from 'axios';
import config from '../config/config';

export default function RegisterPage() {
  const [email, setEmail] = useState('');
  const [verificationCode, setVerificationCode] = useState('');
  const [password, setPassword] = useState('');
  const [username, setUsername] = useState('');
  const [activeStep, setActiveStep] = useState(0);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const navigate = useNavigate();

  const handleSendCode = async () => {
    try {
      const response = await axios.post(`${config.apiBaseUrl}/auth_api.php?action=register_start`, {
        email
      });
      if (response.data.success) {
        setActiveStep(1);
        setSuccess('Verification code sent to your email');
      } else {
        setError(response.data.error || 'Failed to send verification code');
      }
    } catch (err) {
      setError(err.response?.data?.error || 'Failed to send verification code');
    }
  };

  const handleCompleteRegistration = async () => {
    try {
      const response = await axios.post(`${config.apiBaseUrl}/auth_api.php?action=register_complete`, {
        email,
        code: verificationCode,
        password,
        username
      });
      if (response.data.success) {
        navigate(config.routes.login);
      } else {
        setError(response.data.error || 'Registration failed');
      }
    } catch (err) {
      setError(err.response?.data?.error || 'Registration failed');
    }
  };

  const steps = ['Enter Email', 'Verify Email', 'Complete Registration'];

  return (
    <Container maxWidth="sm">
      <Box sx={{ mt: 8, display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
        <Typography component="h1" variant="h5">
          Create an account for {config.appName}
        </Typography>
        <Stepper activeStep={activeStep} sx={{ width: '100%', mt: 3 }}>
          {steps.map((label) => (
            <Step key={label}>
              <StepLabel>{label}</StepLabel>
            </Step>
          ))}
        </Stepper>
        {error && <Typography color="error">{error}</Typography>}
        {success && <Typography color="success">{success}</Typography>}
        <Box sx={{ mt: 3, width: '100%' }}>
          {activeStep === 0 && (
            <>
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
              <Button
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
                onClick={handleSendCode}
              >
                Send Verification Code
              </Button>
            </>
          )}
          {activeStep === 1 && (
            <>
              <TextField
                margin="normal"
                required
                fullWidth
                label="Verification Code"
                value={verificationCode}
                onChange={(e) => setVerificationCode(e.target.value)}
              />
              <Button
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
                onClick={() => setActiveStep(2)}
              >
                Verify Code
              </Button>
            </>
          )}
          {activeStep === 2 && (
            <>
              <TextField
                margin="normal"
                required
                fullWidth
                label="Username"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
              />
              <TextField
                margin="normal"
                required
                fullWidth
                label="Password"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
              <Button
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
                onClick={handleCompleteRegistration}
              >
                Complete Registration
              </Button>
            </>
          )}
          <Box sx={{ textAlign: 'center' }}>
            <Link href={config.routes.login} variant="body2">
              Already have an account? Sign in
            </Link>
          </Box>
        </Box>
      </Box>
    </Container>
  );
}


