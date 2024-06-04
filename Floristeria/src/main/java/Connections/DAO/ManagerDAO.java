package Connections.DAO;

import FlowerStore.FlowerStore;
import FlowerStore.Interfaces.GardenElements;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class ManagerDAO {
    private GenericDAO genericDAO;

    public ManagerDAO(GenericDAO genericDAO){
        this.genericDAO = genericDAO;
    }

    public List<FlowerStore> showFlowerStoreManager(){
        return genericDAO.showFlowerStore();
    }
    public List<GardenElements> showStockManager (FlowerStore flowerStore){
        return genericDAO.allGardenElements(flowerStore);
    }
    public String newStoreManager(String name){
        return genericDAO.createStore(name);
    }
    public void addStockManager(String idFlowerStore, List<GardenElements> products){
        genericDAO.addStock(idFlowerStore, products);
    }
    public void updateStockManager(String idFlowerStore, GardenElements gardenElements){
        genericDAO.updateStock(idFlowerStore, gardenElements);
    }
    public void deleteStockManager(String idFlowerStore, GardenElements gardenElements){
        genericDAO.deleteStock(idFlowerStore, gardenElements);
    }
    public void newTicketManager(FlowerStore flowerStore, List<GardenElements> gardenElementsList){
        genericDAO.addTicket(flowerStore, gardenElementsList);
    }
    public HashMap<String, Date> showAllTicketsManager(String idFlowerStore){
        return genericDAO.allTickets(idFlowerStore);
    }
    public void removeFlowerStore(String flowerStoreId){
        genericDAO.removeFlowerStore(flowerStoreId);
    }
    public double totalPriceManager(String flowerStoreId) {
        return genericDAO.totalPrice(flowerStoreId);
    }

}