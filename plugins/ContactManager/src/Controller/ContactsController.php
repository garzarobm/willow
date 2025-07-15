<?php
declare(strict_types=1);

namespace ContactManager\Controller;

use App\Controller\AppController;


/**
 * Contacts Controller
 *
 * @property \ContactManager\Model\Table\ContactsTable $Contacts
 */
class ContactsController extends AppController
{

    

    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    public function index()
    {

        $contacts = $this->fetchTable('ContactManager.Contacts');

        // Set the contacts variable to be used in the view.
        $this->set(compact('contacts'));
    }

    /**
     * View method
     *
     * @param string|null $id Contact id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $this->set(compact('contact'));
    }



}
