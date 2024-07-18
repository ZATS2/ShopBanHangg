package com.asm.Entity;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class DB {
    public static Map<Long, Item> items = new HashMap<>();
    static {
        items.put(0L, new Item(0L, "BHA Tricky Duet", 210000.0, new Date(121, 3, 15), true, "BRZ", Arrays.asList("fe4e6b99.jpg", "1ff6f8b1.jpg"), 1));
        items.put(1L, new Item(1L, "AHA Rough Love", 350000.0, new Date(121, 3, 15), true, "BRZ", Arrays.asList("95f43f64.jpg", "f9378f99.jpg"), 1));
        items.put(3L, new Item(3L, "Good Night Cleanser", 190000.0, new Date(121, 2, 20), true, "BRZ", Arrays.asList("c439b11e.jpg", "49fee2ff.jpg", "b5e67ba7.jpg"), 1));
        items.put(4L, new Item(4L, "Fairy Water", 350000.0, new Date(121, 2, 20), true, "BRZ", Arrays.asList("c34b8e68.jpg", "4d52083a.jpg"), 1));
        items.put(6L, new Item(6L, "Omnipotent", 850000.0, new Date(121, 2, 20), true, "BRZ", Arrays.asList("dfb4e8ec.jpg", "123ca8be.jpg"), 1));
        items.put(42L, new Item(42L, "Mặt Nạ Emmié by Happy Skin B5 Complex", 37000.0, new Date(121, 2, 22), true, "Emmie", Arrays.asList("62c5848c.jpg", "95d67864.jpg"), 1));
        items.put(43L, new Item(43L, "Nước Thần Emmié by Happy Skin Brightening Plumping Solution Essence", 322000.0, new Date(122, 3, 10), true, "Emmie", Arrays.asList("9953761.jpg", "afd6bdfd.jpg"), 1));
        items.put(44L, new Item(44L, "Gel Rửa Mặt Emmié by Happy Skin Soothing & Hydrating Derma Cleansing Gel", 218000.0, new Date(121, 3, 15), true, "Emmie", Arrays.asList("257366a9.jpg", "e6e4694c.jpg"), 1));
        items.put(45L, new Item(45L, "Obagi BHA 2%", 650000.0, new Date(121, 3, 15), true, "OBG", Arrays.asList("7202c86a.png", "d14d6f27.png"), 1));
        items.put(46L, new Item(46L, "Obagi Retinol 0.5%", 1458000.0, new Date(122, 3, 12), true, "OBG", Arrays.asList("48873d63.jpg", "cbb25b16.jpeg"), 1));
        items.put(47L, new Item(47L, "Kem chống nắng Altruist SPF 50", 189000.0, new Date(122, 3, 12), true, "ALT", Arrays.asList("dc83a420.jpg", "cbbe7516.jpg"), 1));
        items.put(48L, new Item(48L, "Kem chống nắng La roche Posay Anthelios Invisible Fluid", 350000.0, new Date(122, 3, 13), true, "LRP", Arrays.asList("b797b44e.jpg", "c5e1bab8.jpg"), 1));
        items.put(49L, new Item(49L, "La Roche Posay Anthelios Anti-Shine Dry Touch Gel Cream SPF 50+", 370000.0, new Date(122, 3, 13), true, "LRP", Arrays.asList("8b1c902d.webp", "261888e8.jpg"), 1));
        items.put(50L, new Item(50L, "Kem dưỡng ẩm phục hồi B5 Complex", 318000.0, new Date(122, 3, 14), true, "Emmie", Arrays.asList("13cb9960.jpg", "4114138.jpg"), 1));
        items.put(55L, new Item(55L, "Serum Vitamin C Zakka Naturals Glow Fruit Brightening", 445000.0, new Date(122, 2, 15), true, "zak", Arrays.asList("68a1e12d.jpg", "15532ea3.jpg"), 1));
        items.put(56L, new Item(56L, "(Serum) B3 Zakka Naturals Revival Ampoule Anti Blemish 10% Niacinamide + NAG", 552000.0, new Date(122, 2, 15), true, "zak", Arrays.asList("5d33aa51.jpg", "b73998bd.jpg"), 1));
        items.put(57L, new Item(57L, "Mặt Nạ Giảm Mụn, Gom Cồi Và Ngăn Ngừa Mụn Hinoki Acne Mask Zakka Naturals", 280000.0, new Date(122, 2, 15), true, "zak", Arrays.asList("66b82d85.jpg", "c23ebc2f.jpg"), 1));
        items.put(58L, new Item(58L, "Toner (Nước Cân Bằng) Hoa Cúc Zakka Naturals Calendula & Honey Balancing", 275000.0, new Date(122, 3, 15), true, "zak", Arrays.asList("fba867db.jpg", "c753c0ae.jpg"), 1));
        items.put(59L, new Item(59L, "Zakka Naturals Chiết Xuất Tảo Biển Lên Men Fermented Sea Kelp Moisturizing Essence", 320000.0, new Date(122, 3, 15), true, "zak", Arrays.asList("fef54f15.PNG", "cb07a1ec.PNG"), 1));
        items.put(60L, new Item(60L, "La Roche-Posay Pure Vitamin C10 Serum", 1014000.0, new Date(122, 3, 15), true, "LRP", Arrays.asList("652d2a68.jpg", "9d80b35f.jpg"), 1));
        items.put(61L, new Item(61L, "La Roche-Posay Retinol B3 Serum", 844000.0, new Date(122, 3, 15), true, "LRP", Arrays.asList("604cb3e7.jpg", "e7ffb48.jpg"), 1));
        items.put(62L, new Item(62L, "Altruist Face Fluid SPF50 UVA 50ml", 338000.0, new Date(122, 3, 15), true, "ALT", Arrays.asList("4c5907c.PNG", "1b0c2f17.PNG"), 1));
        items.put(63L, new Item(63L, "Cà Phê Đắk Lắk Cocoon Làm Sạch Da Chết Cho Mặt 150ml", 116000.0, new Date(122, 3, 15), true, "CO", Arrays.asList("a621c30.jpg", "e76979f7.jpg"), 1));
        items.put(64L, new Item(64L, "Nước Cân Bằng Cocoon Chiết Xuất Bí Đao 140ml", 140000.0, new Date(122, 3, 15), true, "CO", Arrays.asList("73104d40.jpg", "c3ca2887.jpg"), 1));
        items.put(65L, new Item(65L, "Tinh Chất Bí Đao Cocoon Làm Giảm Mụn, Mờ Thâm 70ml", 210000.0, new Date(122, 3, 15), true, "CO", Arrays.asList("301cf20e.jpg", "456bf2f5.jpg"), 1));
        items.put(66L, new Item(66L, "Dung Dịch Chấm Mụn Cocoon Chiết Xuất Bí Đao 5ml", 85000.0, new Date(122, 3, 15), true, "CO", Arrays.asList("1708e069.jpg", "53456194.jpg"), 1));
    }
}
