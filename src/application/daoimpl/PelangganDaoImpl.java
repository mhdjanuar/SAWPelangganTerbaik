/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package application.daoimpl;

import application.dao.PelangganDao;
import application.models.PelangganModel;
import application.utils.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author mhdja
 */
public class PelangganDaoImpl implements PelangganDao {

    private Connection dbConnection = null;
    private PreparedStatement pstmt = null;
    private ResultSet resultSet = null;
    private String query;

    public PelangganDaoImpl() {
        dbConnection = DatabaseUtil.getInstance().getConnection();
    }

    @Override
    public List<PelangganModel> findAll() {
        List<PelangganModel> listDataAll = new ArrayList<>();

        try {
            query = "SELECT * FROM pelanggan";
            pstmt = dbConnection.prepareStatement(query);
            resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                PelangganModel listData = new PelangganModel();
                listData.setId(resultSet.getInt("id"));
                listData.setName(resultSet.getString("nama"));
                listData.setAlamat(resultSet.getString("alamat"));

                listDataAll.add(listData);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            closeStatement();
        }

        return listDataAll;
    }

    @Override
    public int create(PelangganModel pelanggan) {
        try {
            query = "INSERT INTO pelanggan(nama, alamat) VALUES (?, ?)";
            pstmt = dbConnection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, pelanggan.getName());
            pstmt.setString(2, pelanggan.getAlamat());

            System.out.println("=== Menyimpan Data Pelanggan ===");
            System.out.println("Nama: " + pelanggan.getName());

            int result = pstmt.executeUpdate();
            resultSet = pstmt.getGeneratedKeys();
            if (resultSet.next()) {
                int insertedId = resultSet.getInt(1);
                System.out.println("Data pelanggan berhasil disimpan. ID: " + insertedId);
                return insertedId;
            }

            System.out.println("Data pelanggan disimpan tanpa ID yang dihasilkan.");
            return result;
        } catch (SQLException e) {
            System.out.println("Gagal menyimpan data pelanggan: " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            closeStatement();
        }
    }

    @Override
    public int update(PelangganModel pelanggan) {
        int result = 0;
        try {
            query = "UPDATE pelanggan SET nama = ?, alamat = ? WHERE id = ?";

            pstmt = dbConnection.prepareStatement(query);
            pstmt.setString(1, pelanggan.getName());
            pstmt.setString(2, pelanggan.getAlamat());
            pstmt.setInt(3, pelanggan.getId());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeStatement();
        }

        return result;
    }

    @Override
    public int deletePelanggan(int id) {
        int result = 0;
        try {
            query = "DELETE FROM pelanggan WHERE id = ?";
            pstmt = dbConnection.prepareStatement(query);
            pstmt.setInt(1, id);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeStatement();
        }

        return result;
    }

    private void closeStatement() {
        try {
            if (pstmt != null) {
                pstmt.close();
                pstmt = null;
            }
            if (resultSet != null) {
                resultSet.close();
                resultSet = null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

