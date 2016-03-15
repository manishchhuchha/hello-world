 
<div class="product_page"> 
    <div class="right_column_product">
      
            
        
        <!--========================== product images 
                    =====================================================-->
         <form method='post' action="checkout/cart/add">
            <div class="main_image_page">  
                <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>">   
            <!--- main image -------->    
            <div class="main_image">
                <?php if(!empty($product['image'])){
                $images = explode(",", $product['image']); ?>
                    <a  href="<?= base_url().'theme/images/product/'.$images[0] ?>" rel="gallery1" class="fancybox" id="fancybox">  
                        <image src="<?= base_url().'theme/images/product/'.$images[0] ?>"  id="thumb"/>
                    </a>    
                <?php } else{ ?>
                    <img src="<?= base_url().'theme/images/no-pic.gif'; ?>" />
                <?php } ?>
            </div><!-- main image --->
            
            <!-- sub images -------->
            <?php  if(!empty($images)){ ?>
            <div class="thumb">
               <?php foreach($images as $img) { ?>
                <div class="image">
                    <a  rel="gallery1"  id="box1">  
                        <img src="<?= base_url().'theme/images/product/'.$img; ?>" onclick="swap_image(this.src,'box1')"/>
                    </a>    
                </div>
               <?php } ?>
            </div>
            <?php } ?><!-- sub images --->
            
            </div><!-- images part -->
            
            <div class="desc_right" >
                <div class="title">
                <?= $product['title'] ?>
            </div>
                 <div class="price">
                   <span><?php echo $this->currency->format($product['price']); ?></span>
                     
                   
                 </div>
                
        <!--========================== add-to-cart box
                    ========================================================-->
          
            <div class="desc">
            <?php // Custome Option 
            
                $countoption = count($option);
                if($countoption > 0)
                { ?>
                <div class="option_wrapper">
                <?php $optioncount=0;  for($i=0; $i<=$countoption-1; $i++) 
                    { ?>
                    
                        <ul> <label ><?php echo $option[$i]['label']; ?>:</label>
                            <select class="form-control"  name="option[][<?php echo  $option[$i]['option_id'] ?>]" id="option<?php echo $i+1; ?>" >
                                
                                <?php
                                    $value = explode(",",$option[$i]['value']);
                                    $countvalue=count($value);
                                    for($j=0; $j<=$countvalue-1; $j++) 
                                    {
                                ?>
                                  <option><?php echo $value[$j]; ?></option>
                                <?php  } ?>
                            </select> 
                            <?php 
                            
                            
                            ?>
                        </ul>
                <?php $optioncount++; } ?>
                </div>
                <?php } ?>
                <div class="add-to-cart-box">
                    <label for="qty">Qty:</label>
                    <input class="form-control qty-txt" value="1" type="text" name="qty" id="qty" size="3" />
                    <button class="btn btn-primary btn-cart" value="Add to Cart" name="cart">
                        Add to Cart
                    </button> 
                </div>
                <?php if(!empty($customer)){ ?>
                <div class="seller_desc">
                    <h3 class="seller_title">Seller Information</h3>
                    <div class="seller_info">
                        <div class="title_contant">
                        <div class="seller_contact">
                            <div class="info">Seller Name :&nbsp;&nbsp;&nbsp;</div>
                            <div class="info">Seller Email :&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </div>
                        <div class="seller_contact">
                            <div> <?php echo $customer['firstname'],' ', $customer['lastname'] ; ?> </div>
                            <div> <?php echo $customer['email'] ; ?> </div>
                        </div>
                        </div>
                     </div>
                </div> 
                <?php } ?>
            </div>
            </div>
            </form>
        </div>
    
        <!--========================== Description
                    ========================================================-->
        
        <div class="description_wrapper">
            <div class="title">
                Description
            </div>
            <div class="description">
                <?= $product['description'] ?>
            </div>   
        </div>
    </div>
   
<!--================================= Javascripts
        ===================================================================---->
<link rel="stylesheet" href="<?= base_url() ?>theme/plugins/fancybox/jquery.fancybox.css" type="text/css" /> 
<script src="<?= base_url() ?>theme/plugins/fancybox/jquery.fancybox.pack.js"></script>
<script>
   
    $(".fancybox").fancybox();
    
    $('.btn-cart').click(function(){
       var optionss = [];
       var option_count = "<?php echo $optioncount ?>";    
       for(var i=1; i<=option_count; i++)
       {
            var optionid = document.getElementById("option"+i).name; 
            var option_val = document.getElementById("option"+i).value; 
            optionss.push(optionid,option_val);
       }
        var quotedCSV = '' + optionss.join(',') + '';
        
         location="<?= site_url('checkout/cart/add/'.$product['product_id']) ?>"+'/'+$('#qty').val()+'/'+$('#option1').val()+'/'+$('#option2').val()  ;
    });
 </script>
 <script>   
    function swap_image(img,imgid)
    {
        document.getElementById("thumb").src=img;
        document.getElementById("fancybox").href=img; 
        $('div').removeClass('img-sel');
        document.getElementById(imgid).className = 's-img img-sel';
    }
</script>