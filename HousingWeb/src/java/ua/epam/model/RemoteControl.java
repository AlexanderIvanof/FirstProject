package ua.epam.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Class control for GOF pattern "Command"
 *
 * @author Ivanov Alexander
 */
public class RemoteControl {

    Command command;

    public RemoteControl() {
    }

    public void setCommand(Command command) {
        this.command = command;
    }

    public void doCommand(HttpServletRequest request, HttpServletResponse response) {
        command.execute(request, response);
    }
}
