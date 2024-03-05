package FlowerStore;

import FlowerStore.Interfaces.GardenElements;
import FlowerStore.Interfaces.IFlowerStore;

public class FlowerStoreFactory implements IFlowerStore {
    private String name;
    public FlowerStoreFactory(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "FlowerStoreFactory{" +
                "name='" + name + '\'' +
                '}';
    }

    @Override
    public GardenElements getElement(GardenElements element) {
        //element.configure;
        return element;
    }
}

