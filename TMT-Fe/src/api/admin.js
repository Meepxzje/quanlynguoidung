// api/admin.js
const API_URL = import.meta.env.VITE_API_URL;

export const getAllUsers = async (token) => {
  const res = await fetch(`${API_URL}/admin/users`, {
    method: "GET",
    headers: {
      Authorization: `Bearer ${token}`,
      Accept: "application/json",
    },
  });

  if (!res.ok) throw new Error("Không thể lấy danh sách người dùng");
  return res.json();
};

export const getUserById = async (token, id) => {
  const res = await fetch(`${API_URL}/admin/users/${id}`, {
    method: "GET",
    headers: {
      Authorization: `Bearer ${token}`,
      Accept: "application/json",
    },
  });

  if (!res.ok) throw new Error("Không thể lấy thông tin người dùng");
  return res.json();
};

export const updateUserById = async (token, id, userData) => {
  const res = await fetch(`${API_URL}/admin/users/${id}`, {
    method: "PUT",
    headers: {
      Authorization: `Bearer ${token}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(userData),
  });

  if (!res.ok) throw new Error("Cập nhật người dùng thất bại");
  return res.json();
};

export const deleteUserById = async (token, id) => {
  const res = await fetch(`${API_URL}/admin/users/${id}`, {
    method: "DELETE",
    headers: {
      Authorization: `Bearer ${token}`,
      Accept: "application/json",
    },
  });

  if (!res.ok) throw new Error("Xóa người dùng thất bại");
  return res.ok;
};
