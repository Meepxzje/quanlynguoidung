// api/user.js
const API_URL = import.meta.env.VITE_API_URL;

export const getUserProfile = async (token) => {
  const res = await fetch(`${API_URL}/user/profile`, {
    method: "GET",
    headers: {
      Authorization: `Bearer ${token}`,
      Accept: "application/json",
    },
  });
  if (!res.ok) throw new Error("Không thể lấy thông tin hồ sơ");
  return res.json();
};

export const updateUserProfile = async (token, userData) => {
  const res = await fetch(`${API_URL}/user/profile`, {
    method: "PUT",
    headers: {
      Authorization: `Bearer ${token}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(userData),
  });

  if (!res.ok) throw new Error("Cập nhật hồ sơ thất bại");
  return res.json();
};


export const updateUserPassword = async (token, passwordData) => {
  const res = await fetch(`${API_URL}/user/profile/updatepassword`, {
    method: "POST",
    headers: {
      Authorization: `Bearer ${token}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(passwordData),
  });

  if (!res.ok) throw new Error("Cập nhật mật khẩu thất bại");
  return res.json();
};
