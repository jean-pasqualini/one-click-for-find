<?php

namespace Range\FindOneClickBundle\Listener;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class ObjectListener implements EventSubscriberInterface {
    public static function getSubscribedEvents()
    {
        // TODO: Implement getSubscribedEvents() method.

        return array(
            "rfoc.object.created" => "onObjectCreated"
        );
    }

    public function onObjectCreated()
    {

    }

}