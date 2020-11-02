<?php 
class response{
    /*public $status, $info, $error_number;
    public $response;
    public $array;
    
 
    function arr_filter(&$array)
    {
        $array = array_filter($array);
        for($i = 0; $i < count($array); $i++){
            $this->var_filter($array[$i]);
        }
    }
    
    function obj_filter(&$object){
        //$object = (object) array_filter((array) $object);
        //foreach ($object as $key => $value) {
        //    $this->var_filter($object[$key]);
        //}
        $array = (array) $object;
        $object = (object) $this->var_filter($array);
    }
    
    function var_filter(&$var){
        if (is_array($var)) $this->arr_filter($var);
        else if (is_object($var)) $this->obj_filter($var);
    }
    
    function get_json(){
        var_dump($this);
        echo json_encode($this, JSON_NUMERIC_CHECK|JSON_UNESCAPED_SLASHES);
        $response = $this;
        $this->var_filter($response);
        var_dump($response);
        echo json_encode($response, JSON_NUMERIC_CHECK|JSON_UNESCAPED_SLASHES);
    }    
    */
}
?>