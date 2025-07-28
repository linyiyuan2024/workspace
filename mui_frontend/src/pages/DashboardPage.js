

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Container,
  Box,
  Typography,
  Button,
  Avatar,
  Paper,
  List,
  ListItem,
  ListItemText,
  ListItemAvatar,
  Divider
} from '@mui/material';
import axios from 'axios';
import config from '../config/config';

export default function DashboardPage() {
  const [userInfo, setUserInfo] = useState(null);
  const [error, setError] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    const fetchUserInfo = async () => {
      try {
        const response = await axios.get(`${config.apiBaseUrl}/auth_api.php?action=user_info`);
        if (response.data.success) {
          setUserInfo(response.data.user);
        } else {
          navigate(config.routes.login);
        }
      } catch (err) {
        navigate(config.routes.login);
      }
    };
    fetchUserInfo();
  }, [navigate]);

  const handleLogout = async () => {
    try {
      await axios.post(`${config.apiBaseUrl}/auth_api.php?action=logout`);
      localStorage.removeItem(config.authTokenKey);
      navigate(config.routes.login);
    } catch (err) {
      setError('Logout failed');
    }
  };

  if (!userInfo) return <div>Loading...</div>;

  return (
    <Container maxWidth="md">
      <Box sx={{ mt: 4, display: 'flex', justifyContent: 'space-between' }}>
        <Typography variant="h4">Welcome to {config.appName}</Typography>
        <Button variant="contained" color="error" onClick={handleLogout}>
          Logout
        </Button>
      </Box>
      {error && <Typography color="error">{error}</Typography>}
      <Paper sx={{ mt: 4, p: 3 }}>
        <Typography variant="h6" gutterBottom>
          Your Profile
        </Typography>
        <Divider />
        <List>
          <ListItem>
            <ListItemAvatar>
              <Avatar>{userInfo.username?.charAt(0).toUpperCase()}</Avatar>
            </ListItemAvatar>
            <ListItemText primary="Username" secondary={userInfo.username} />
          </ListItem>
          <ListItem>
            <ListItemText primary="Email" secondary={userInfo.email} />
          </ListItem>
          <ListItem>
            <ListItemText primary="Registration Date" secondary={new Date(userInfo.register_at).toLocaleDateString()} />
          </ListItem>
        </List>
      </Paper>
    </Container>
  );
}

