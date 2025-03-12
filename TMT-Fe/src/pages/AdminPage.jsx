/* eslint-disable react-hooks/exhaustive-deps */
import { useState, useEffect } from "react";
import {
  getAllUsers,
  getUserById,
  updateUserById,
  deleteUserById,
} from "../api/admin";
import { toast } from "react-toastify";
import Header from "../components/Header";

export default function AdminPage() {
  const [users, setUsers] = useState([]);
  const [selectedUser, setSelectedUser] = useState(null);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [loading, setLoading] = useState(false);
  const token = localStorage.getItem("token");

  useEffect(() => {
    fetchUsers();
  }, []);

  const fetchUsers = async () => {
    try {
      setLoading(true);
      const data = await getAllUsers(token);
      setUsers(data.users);
    } catch (error) {
      toast.error(error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleOpenModal = async (id) => {
    try {
      setLoading(true);
      const response = await getUserById(token, id);
      if (response.success) {
        setSelectedUser(response.user);
        setIsModalOpen(true);
        setIsEditing(false);
      } else {
        toast.error("Không tìm thấy người dùng.");
      }
    } catch (error) {
      toast.error(error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleCloseModal = () => {
    setSelectedUser(null);
    setIsModalOpen(false);
  };

  const handleEdit = () => {
    setIsEditing(true);
  };

  const handleSave = async () => {
    if (!window.confirm("Bạn có chắc chắn muốn lưu thay đổi?")) {
      return;
    }
    try {
      await updateUserById(token, selectedUser.id, selectedUser);
      toast.success("Cập nhật thành công!");
      fetchUsers();
      setIsEditing(false);
    } catch (error) {
      toast.error(error.message);
    }
  };

  const handleDeleteUser = async () => {
    if (!window.confirm("Bạn có chắc chắn muốn xóa người dùng này?")) {
      return;
    }
    try {
      await deleteUserById(token, selectedUser.id);
      toast.success("Xóa người dùng thành công!");
      fetchUsers();
      handleCloseModal();
    } catch (error) {
      toast.error(error.message);
    }
  };

  return (
    <>
      <Header />
      <div className="container mx-auto mt-8">
        <h2 className="text-2xl font-bold text-center mb-4">
          Quản lý người dùng
        </h2>
        {loading ? (
          <p className="text-center">Đang tải...</p>
        ) : (
          <table className="w-full border-collapse border border-gray-300">
            <thead>
              <tr className="bg-gray-200">
                <th className="border p-2">ID</th>
                <th className="border p-2">Tên</th>
                <th className="border p-2">Email</th>
                <th className="border p-2">Vai trò</th>
                <th className="border p-2">Hành động</th>
              </tr>
            </thead>
            <tbody>
              {users.length > 0 ? (
                users.map((user) => (
                  <tr key={user.id} className="text-center">
                    <td className="border p-2">{user.id}</td>
                    <td className="border p-2">{user.name}</td>
                    <td className="border p-2">{user.email}</td>
                    <td className="border p-2">{user.role}</td>
                    <td className="border p-2">
                      <button
                        onClick={() => handleOpenModal(user.id)}
                        className="bg-blue-500 text-white px-3 py-1 rounded"
                      >
                        Chi tiết
                      </button>
                    </td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan="5" className="text-center p-4">
                    Không có người dùng nào
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        )}

        {/* Modal hiển thị chi tiết user */}
        {isModalOpen && selectedUser && (
          <div className="fixed inset-0 flex items-center justify-center bg-black/75">
            <div className="bg-white p-6 rounded-lg shadow-lg w-1/2 relative">
              <div className="flex justify-between mb-3">
                <h3 className="text-xl font-bold mb-4">Thông tin người dùng</h3>

                <button
                  onClick={handleCloseModal}
                  className="bg-blue-500 text-white px-4 py-2 rounded"
                >
                  Đóng
                </button>
              </div>

              <div className="mb-2">
                <label className="font-semibold">Tên:</label>
                <input
                  type="text"
                  className="w-full border p-2 rounded"
                  value={selectedUser.name}
                  disabled={!isEditing}
                  onChange={(e) =>
                    setSelectedUser({ ...selectedUser, name: e.target.value })
                  }
                />
              </div>

              <div className="mb-2">
                <label className="font-semibold">Email:</label>
                <input
                  type="email"
                  className="w-full border p-2 rounded bg-gray-400"
                  value={selectedUser.email}
                  disabled
                />
              </div>

              <div className="mb-4">
                <label className="font-semibold">Vai trò:</label>
                <select
                  className="w-full border p-2 rounded"
                  value={selectedUser.role}
                  disabled={!isEditing}
                  onChange={(e) =>
                    setSelectedUser({ ...selectedUser, role: e.target.value })
                  }
                >
                  <option value="user">User</option>
                  <option value="admin">Admin</option>
                </select>
              </div>

              <div className="flex justify-around">
                {!isEditing ? (
                  <button
                    onClick={handleEdit}
                    className="bg-yellow-500 text-white px-4 py-2 rounded"
                  >
                    Sửa
                  </button>
                ) : (
                  <button
                    onClick={handleSave}
                    className="bg-green-500 text-white px-4 py-2 rounded"
                  >
                    Lưu
                  </button>
                )}

                <button
                  onClick={handleDeleteUser}
                  className="bg-red-500 text-white px-4 py-2 rounded"
                >
                  Xóa
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </>
  );
}
