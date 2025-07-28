


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

export default function ForgotPasswordPage() {
  const [email, setEmail] = useState('');
  const [verificationCode, setVerificationCode] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [activeStep, setActiveStep] = useState(0);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const navigate = useNavigate();

  const handleSendCode = async () => {
    try {
      const response = await axios.post(`${config.apiBaseUrl}/auth_api.php?action=forgot_password_start`, {
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

  const handleResetPassword = async () => {
    try {
      const response = await axios.post(`${config.apiBaseUrl}/auth_api.php?action=forgot_password_complete`, {
        email,
        code: verificationCode,
        new_password: newPassword
      });
      if (response.data.success) {
        navigate(config.routes.login);
      } else {
        setError(response.data.error || 'Password reset failed');
      }
    } catch (err) {
      setError(err.response?.data?.error || 'Password reset failed');
    }
  };

  const steps = ['Enter Email', 'Verify Code', 'New Password'];

  return (
    <Container maxWidth="sm">
      <Box sx={{ mt: 8, display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
        <Typography component="h1" variant="h5">
          Reset Password
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
                label="New Password"
                type="password"
                value={newPassword}
                onChange={(e) => setNewPassword(e.target.value)}
              />
              <Button
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
                onClick={handleResetPassword}
              >
                Reset Password
              </Button>
            </>
          )}
          <Box sx={{ textAlign: 'center' }}>
            <Link href={config.routes.login} variant="body2">
              Back to Sign In
            </Link>
          </Box>
        </Box>
      </Box>
    </Container>
  );
}


