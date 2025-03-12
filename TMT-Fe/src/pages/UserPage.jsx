import { useState, useEffect } from "react";
import { getUserProfile, updateUserProfile,updateUserPassword } from "../api/user";
import { toast } from "react-toastify";
import Header from "../components/Header";

export default function ProfilePage() {
  const [user, setUser] = useState(null);
  const [isEditing, setIsEditing] = useState(false);
  const [loading, setLoading] = useState(false);
  const [avatar, setAvatar] = useState("https://placehold.co/600x400/png");
  const [passwordData, setPasswordData] = useState({
    currentPassword: "",
    newPassword: "",
    confirmNewPassword: "",
  });
  const token = localStorage.getItem("token");

  useEffect(() => {
    fetchUserProfile();
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const fetchUserProfile = async () => {
    try {
      setLoading(true);
      const data = await getUserProfile(token);
      setUser(data.user);
    } catch (error) {
      toast.error(error.message);
    } finally {
      setLoading(false);
    }
  };

  const handleEdit = () => {
    setIsEditing(true);
  };

  const handleSave = async () => {
    if (!window.confirm("Bạn có chắc chắn muốn lưu thay đổi?")) return;

    try {
      setLoading(true);
      await updateUserProfile(token, user);
      toast.success("Cập nhật hồ sơ thành công!");
      setIsEditing(false);
    } catch (error) {
      toast.error(error.message);
    } finally {
      setLoading(false);
    }
  };

  const handlePasswordChange = async () => {
    if (passwordData.newPassword !== passwordData.confirmNewPassword) {
      toast.error("Mật khẩu xác nhận không khớp!");
      return;
    }
  
    try {
      setLoading(true);
      await updateUserPassword(token, {
        current_password: passwordData.currentPassword,
        new_password: passwordData.newPassword,
        new_password_confirmation: passwordData.confirmNewPassword,
      });
      toast.success("Mật khẩu đã được cập nhật!");
      setPasswordData({ currentPassword: "", newPassword: "", confirmNewPassword: "" });
  
    } catch (error) {
      toast.error(error.message || "Cập nhật mật khẩu thất bại");
    } finally {
      setLoading(false);
    }
  };

  const handleAvatarChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      const url = URL.createObjectURL(file);
      setAvatar(url);
    }
  };

  return (

    <>
    <Header></Header>
    <div className="container mx-auto mt-8 max-w-lg bg-white p-6 rounded-lg shadow-lg">
      <h2 className="text-2xl font-bold text-center mb-4">Hồ sơ cá nhân</h2>

      {loading ? (
        <p className="text-center">Đang tải...</p>
      ) : user ? (
        <div>
          {/* Ảnh đại diện */}
          <div className="flex justify-center mb-4 relative">
            <label htmlFor="avatarUpload" className="cursor-pointer">
              <img
                src={avatar}
                alt="Avatar"
                className="w-24 h-24 rounded-full border-4 border-gray-300 object-cover"
              />
            </label>
            <input
              type="file"
              id="avatarUpload"
              accept="image/*"
              className="hidden"
              onChange={handleAvatarChange}
            />
          </div>

          {/* Thông tin cá nhân */}
          <div className="mb-3">
            <label className="font-semibold">Tên:</label>
            {isEditing ? (
              <input
                type="text"
                className="w-full border p-2 rounded"
                value={user.name}
                onChange={(e) => setUser({ ...user, name: e.target.value })}
              />
            ) : (
              <p className="border p-2 rounded bg-gray-100">{user.name}</p>
            )}
          </div>

          <div className="mb-3">
            <label className="font-semibold">Email:</label>
            <p className="border p-2 rounded bg-gray-300">{user.email}</p>
          </div>

          <div className="flex justify-between mt-4">
            {!isEditing ? (
              <button
                onClick={handleEdit}
                className="bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-600"
              >
                Sửa
              </button>
            ) : (
              <button
                onClick={handleSave}
                className="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 disabled:bg-gray-400"
                disabled={loading}
              >
                {loading ? "Đang lưu..." : "Lưu"}
              </button>
            )}
          </div>

          <div className="mt-8 border-t pt-4">
            <h3 className="text-xl font-bold mb-2">Thay đổi mật khẩu</h3>

            <div className="mb-3">
              <label className="font-semibold">Mật khẩu hiện tại:</label>
              <input
                type="password"
                className="w-full border p-2 rounded"
                placeholder="Nhập mật khẩu hiện tại"
                value={passwordData.currentPassword}
                onChange={(e) =>
                  setPasswordData({ ...passwordData, currentPassword: e.target.value })
                }
              />
            </div>

            <div className="mb-3">
              <label className="font-semibold">Mật khẩu mới:</label>
              <input
                type="password"
                className="w-full border p-2 rounded"
                placeholder="Nhập mật khẩu mới"
                value={passwordData.newPassword}
                onChange={(e) =>
                  setPasswordData({ ...passwordData, newPassword: e.target.value })
                }
              />
            </div>

            <div className="mb-3">
              <label className="font-semibold">Xác nhận mật khẩu mới:</label>
              <input
                type="password"
                className="w-full border p-2 rounded"
                placeholder="Nhập lại mật khẩu mới"
                value={passwordData.confirmNewPassword}
                onChange={(e) =>
                  setPasswordData({ ...passwordData, confirmNewPassword: e.target.value })
                }
              />
            </div>

            <button
              onClick={handlePasswordChange}
              className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 disabled:bg-gray-400"
              disabled={loading}
            >
              {loading ? "Đang cập nhật..." : "Cập nhật mật khẩu"}
            </button>
          </div>
        </div>
      ) : (
        <p className="text-center text-red-500">Không thể tải thông tin.</p>
      )}
    </div>

    </>
  );
}
