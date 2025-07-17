/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package application.dao;

/**
 *
 * @author mhdja
 */
import application.models.PelangganModel;
import java.util.List;

public interface PelangganDao {
    List<PelangganModel> findAll();
    int create(PelangganModel pelanggan);
    int update(PelangganModel pelanggan);
    int deletePelanggan(int id);
}

