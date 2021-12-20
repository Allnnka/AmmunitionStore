package com.allnnka.service;


import com.allnnka.model.Ammunition;
import com.allnnka.repository.AmmunitionRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AmmunitionService {
    final AmmunitionRepository ammunitionRepository;

    public AmmunitionService(AmmunitionRepository ammunitionRepository) {
        this.ammunitionRepository = ammunitionRepository;
    }
    public void addAmmunition(Ammunition ammunition){
        if(ammunitionRepository.findByType(ammunition.getType())!=null) {
            Ammunition ammunitionUpdate = ammunitionRepository.findByType(ammunition.getType());
            ammunitionUpdate.setAmount(ammunitionUpdate.getAmount() + ammunition.getAmount());
            ammunitionRepository.save(ammunitionUpdate);
        }
        else{
                ammunitionRepository.save(ammunition);
        }
    }
    public List<Ammunition> getAll(){
        return ammunitionRepository.findAll();
    }

    public void deleteAmmunition(Ammunition ammunition){
        if(ammunitionRepository.findByType(ammunition.getType())!=null){
            Ammunition ammunitionUpdate = ammunitionRepository.findByType(ammunition.getType());
            if(ammunitionUpdate.getAmount() - ammunition.getAmount()<=0){
                System.out.println("Ilość jest mniejsza 0");
            }else{
                ammunitionUpdate.setAmount(ammunitionUpdate.getAmount() - ammunition.getAmount());
                ammunitionRepository.save(ammunitionUpdate);
            }
        }
    }

}
