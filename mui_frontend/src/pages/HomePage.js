


import React from 'react';
import { Link } from 'react-router-dom';
import {
  Container,
  Box,
  Typography,
  Button,
  Grid,
  Paper
} from '@mui/material';
import config from '../config/config';

export default function HomePage() {
  return (
    <Container maxWidth="lg">
      <Box sx={{ 
        mt: 8,
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        textAlign: 'center'
      }}>
        <Typography variant="h2" component="h1" gutterBottom>
          Welcome to {config.appName}
        </Typography>
        <Typography variant="h5" color="text.secondary" paragraph>
          A secure authentication system with email verification
        </Typography>
        <Grid container spacing={2} justifyContent="center" sx={{ mt: 4 }}>
          <Grid item>
            <Paper elevation={3} sx={{ p: 3, minWidth: 200 }}>
              <Typography variant="h6" gutterBottom>Existing User</Typography>
              <Button 
                component={Link} 
                to={config.routes.login}
                variant="contained"
                fullWidth
              >
                Sign In
              </Button>
            </Paper>
          </Grid>
          <Grid item>
            <Paper elevation={3} sx={{ p: 3, minWidth: 200 }}>
              <Typography variant="h6" gutterBottom>New User</Typography>
              <Button 
                component={Link} 
                to={config.routes.register}
                variant="contained"
                fullWidth
              >
                Sign Up
              </Button>
            </Paper>
          </Grid>
        </Grid>
      </Box>
    </Container>
  );
}


